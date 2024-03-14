var main = function(){
    let style = document.getElementById("additionalStyle");
    let colors = [
        "FFB511",
        "005581",
        "1295D8",
        "FFB511",
        "00778B",
        "E44C9A",
        "FF6E1B",
        "FF8F28",
        "D462AD",
        "6E963B"
    ];
    var randomColor = colors[Math.floor(Math.random() * colors.length)];
    style.innerHTML = `
    :root {
        --main-color: #${randomColor};
    }

    @media (prefers-color-scheme: dark) {
        :root {
            --main-color: #${randomColor};
        }
    }`
}