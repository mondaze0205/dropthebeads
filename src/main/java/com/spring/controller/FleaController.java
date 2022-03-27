package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.spring.dto.FleaCommDto;
import com.spring.dto.FleaDto;
import com.spring.dto.ImgDto;
import com.spring.dto.UsersDto;
import com.spring.service.FleaService;

@SessionAttributes("user")
@Controller
public class FleaController {

	@Autowired
	FleaService service;

	@GetMapping("/flea/flist")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page, Model m,
			@RequestParam(name = "c", defaultValue = "1") int f_category) {

		int count = service.count();
		if (count > 0) {

			int perPage = 10;
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<FleaDto> fList = service.fList(startRow, endRow, f_category);
			m.addAttribute("fList", fList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);

		}
		m.addAttribute("count", count);
		return "flea/flist";
	}

	@GetMapping("/flea/fwrite")
	public String writeFleaForm(@ModelAttribute("user") UsersDto dto) {
		return "flea/fwrite";
	}

	@PostMapping("/flea/fwrite")
	public String write(FleaDto dto, MultipartFile f_img, Model m) {
		String fileName = upload(f_img);

		ImgDto dto2 = new ImgDto();
		dto2.setImgname(f_img.getOriginalFilename());
		dto2.setImgpath(fileName);
		dto2.setImgsize(f_img.getSize());
		int i = service.imgInsert(dto2);
		m.addAttribute("fileName", dto2);
		// System.out.println(dto2.getImgid());
		// System.out.println(i);
		dto.setImgid(i);
		service.fInsert(dto);
		return "redirect:flist";
	}

	private String upload(MultipartFile f_img) {
		String origName = f_img.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index + 1);

		Random r = new Random();
		String fileName = System.currentTimeMillis() + "_" + r.nextInt(50) + "." + ext;

		try {
			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			File f = new File(path, fileName);
			f_img.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}

	@GetMapping("/flea/fcontent/{f_postno}")
	public String content(@PathVariable int f_postno, Model m) {
		FleaDto dto = service.fBoard(f_postno);
		ImgDto dto2 = service.iBoard(dto.getImgid());
		m.addAttribute("dto", dto);
		m.addAttribute("dto2", dto2);

		List<FleaCommDto> cList = service.selectComm(f_postno);
		m.addAttribute("cList", cList);
		int commCnt = service.commCount(f_postno);
		m.addAttribute("commCnt", commCnt);

		String fleaMap = service.selectMap(f_postno);
		m.addAttribute("fleaMap", fleaMap);

		return "flea/fcontent";
	}

	@GetMapping("flea/fupdate/{f_postno}")
	public String updateForm(@PathVariable int f_postno, Model m) {
		FleaDto dto = service.fBoard(f_postno);
		m.addAttribute("dto", dto);
		return "flea/fupdate";
	}

	@PostMapping("/flea/fupdate")
	public String update(FleaDto dto, MultipartFile f_img, Model m) {
		String fileName = updateimg(f_img);
		// System.out.println(dto);

		ImgDto dto2 = new ImgDto();
		dto2.setImgid(dto.getImgid());
		dto2.setImgname(f_img.getOriginalFilename());
		dto2.setImgpath(fileName);
		dto2.setImgsize(f_img.getSize());

		if (dto2.getImgsize() != 0) {
			// int i = 141;
			service.updateImg(dto2);
		}
		m.addAttribute("fileName", dto2);
		// dto.setImgid(i);
		service.updateFboard(dto);
		// System.out.println(dto);
		// System.out.println(dto2);
		return "redirect:flist";
	}

	private String updateimg(MultipartFile f_img) {
		String origName = f_img.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index + 1);

		Random r = new Random();
		String fileName = System.currentTimeMillis() + "_" + r.nextInt(50) + "." + ext;

		try {
			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			File f = new File(path, fileName);
			f_img.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}

	@DeleteMapping("/flea/delete")
	@ResponseBody
	public String delete(int f_postno) {
		int i = service.deleteFboard(f_postno);
		return "" + i;
	}

	@GetMapping("/flea/fdelete")
	public String fdelete() {
		return "flea/fdelete";
	}

	@GetMapping("/flea/address")
	public String address() {
		return "flea/address";
	}

	@GetMapping("/flea/fsearch")
	public String search(int searchn, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(searchn, search);
		if (count > 0) {

			int perPage = 10;
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;

			List<FleaDto> boardList = service.boardListSearch(searchn, search, startRow, endRow);
			m.addAttribute("bList", boardList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);

		}
		m.addAttribute("count", count);
		m.addAttribute("searchn", searchn);
		m.addAttribute("search", search);

		return "flea/fsearch";
	}

	@GetMapping("/flea/insert")
	@ResponseBody
	public String fleainsert(@ModelAttribute("user") UsersDto user, FleaCommDto dto) {
		int i = service.insertComm(dto);
		System.out.println(dto);
		return i + "";
	}

	@GetMapping("/flea/delete/{f_cno}")
	@ResponseBody
	public String fleadelete(int f_cno) {
		int i = service.deleteComm(f_cno);
		return i + "";
	}

	@GetMapping("/flea/update/{f_cno}")
	@ResponseBody
	public String fleaupdate(FleaCommDto dto) {
		int i = service.updateComm(dto);
		return i + "";
	}

	@GetMapping("flea/clike/{f_cno}")
	@ResponseBody
	public String fleacLike(FleaCommDto dto, Model m) {
		int i = service.cLike(dto);
		return i + "";
	}

	@GetMapping("flea/fleamap")
	public String fleamap(Model m) {
		List<FleaDto> MapMarkers = service.selectMaps();
		m.addAttribute("MapMarkers", MapMarkers);
		return "flea/fleamap";
	}

	@PostMapping("flea/mimg/{id}") // ╧наж
	@ResponseBody
	public String mimg(@PathVariable int id, Model m) {

		ImgDto dto2 = service.iBoard(id);
		Gson g = new Gson();
		String s = g.toJson(dto2);

		return s;
	}
	
	@GetMapping("/flea/match2")
	@ResponseBody
	public String match2(String imgid) {
		return service.match2(imgid);
	}

}
