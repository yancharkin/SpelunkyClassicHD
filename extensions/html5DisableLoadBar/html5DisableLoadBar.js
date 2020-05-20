var backgroundColor = "rgba(0, 0, 0, 255)";
var textColor = "rgba(255, 255, 255, 255)";

function html5DisableLoadBar(graphics, width, height, total, current, loadingscreen) {
    let text = current + "/" + total;
    console.log(text);
    if (navigator.userAgent.toLowerCase().indexOf('electron') == -1) {
        graphics.fillStyle = backgroundColor;
        graphics.fillRect(0, 0, width, height);
        graphics.fillStyle = textColor;
        graphics.lineStyle = textColor;
        graphics.font = "32px Sans";
        graphics.textAlign = "left";
        graphics.fillText(text, 10, 40);
    }
}
