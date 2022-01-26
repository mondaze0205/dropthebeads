<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <!-- Ensures proper rendering and touch zooming -->
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <title>Pixel Art Maker</title>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Helvetica">
    <link rel="stylesheet" type="text/css" href="../resources/css/painter.css"> 
  </head>
  <body>
    <div class="row">
      <div class="column">
        <div class="inputs">
          <h4>choose grid size</h4>
          <!-- class names all lower case and delimited with hyphens per Udacity Frontend Nanodegree Style Guide (CSS page) -->
          <form class="size-picker">
            height:
            <input type="number" class="input-height" name="height" min="1" max="50" value="25">
            <br><br>
            width:
            <input type="number" class="input-width" name="width" min="1" max="50" value="25">
            <input type="submit" class="submit-button" value="submit">
            <p><em>also clears grid</em></p>
          </form>
          <h4>select color</h4>
          <input type="color" class="color-picker" value="#6aa5b8">
          <input type="button" class="quick-fill" value="fill">
          <h4>mode</h4>
          <input type="button" class="erase-mode" value="erase">
          <p><em>or double-click to erase</em></p>
          <input type="button" class="draw-mode" value="draw">
        </div>
      </div>
      <div class="column">
        <h1>Pixel Art Maker</h1>
        <table class="pixel-canvas"></table>
        <br>
      </div>
    </div>
<input type="button" id="btn001" value="click">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../resources/js/painter.js"></script>
  </body>
</html>
