$('canvas').mousedown(function(e){
  down_flag = true;
  var ev = ev || window.event;
  ctx.moveTo(ev.clientX - canvas_dom.offsetLeft, ev.clientY - canvas_dom.offsetTop);
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 10;
}).mouseup(function(e){
  down_flag = false;
}).mousemove(function(e){
  if(down_flag) {
    var ev = ev || window.event;
    ctx.lineTo(ev.clientX - canvas_dom.offsetLeft, ev.clientY - canvas_dom.offsetTop);
    ctx.stroke();
  }
})

function compressImg(img, res) {
  // 缩放图片需要的canvas
  var canvas = document.createElement('canvas');
  var context = canvas.getContext('2d');

  var maxSize = 660,
      oriWidth = img.width,
      oriHeight = img.height,
      tarWidth = img.width,
      tarHeight = img.height;
  var max = oriWidth > oriHeight ? oriWidth : oriHeight;

  if(max > maxSize) {
    // 宽度压缩到800，高度相应压缩
    if(oriWidth > oriHeight) {
      tarWidth = maxSize;
      tarHeight = Math.round(oriHeight * (maxSize / oriWidth));
    } else {
      tarHeight = maxSize;
      tarWidth = Math.round(oriWidth * (maxSize / oriHeight));
    }
  } 
  else {
    res.width = tarWidth;
    res.height = tarHeight;
    res.src = img.src;
    return;
  }

  // canvas对图片进行缩放
  res.width = tarWidth;
  res.height = tarHeight;

  canvas.width = tarWidth;
  canvas.height = tarHeight;

  // 清除画布
  context.clearRect(0, 0, tarWidth, tarHeight);

  // 图片压缩
  context.drawImage(img, 0, 0, tarWidth, tarHeight);
  res.resize = true;
  res.src = canvas.toDataURL("image/png");

  return ;
}