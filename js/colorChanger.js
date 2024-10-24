var main = function(){
    let style = document.getElementById("additionalStyle");
    let colors = [
        "#D52D00",
        "#EF7627",
        "#FF9A56",
        "#D162A4",
        "#B55690",
        "#A30262"
    ];
    var randomColor = colors[Math.floor(Math.random() * colors.length)];
    style.innerHTML = `
    :root {
        --main-color: ${randomColor};
    }
    
    @media (prefers-color-scheme: dark) {
        :root {
            --main-color: ${randomColor};
        }
    }`
}