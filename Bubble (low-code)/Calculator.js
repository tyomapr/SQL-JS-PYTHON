//To activate a button (0-9) in Run JS via Bubble
document.getElementById("Text").innerHTML += 0 // The rest buttons are done in the same way according to its value

//Clear button
let textElement = document.getElementById("Text");
textElement.innerHTML = ""

//Remove button
let calculation = document.getElementById("Text")
calculation.innerHTML = calculation.innerHTML.slice(0,-1)

//"+" button
let textElement = document.getElementById("Text");
let result = textElement.innerHTML;
let lastCharacter = result.charAt(result.length - 1);
if (lastCharacter !== "+" && lastCharacter !== "-"){
textElement.innerHTML += "+"
} else {
alert("You cannot enter two signs in a row! ");
}

//"-" button
let textElement = document.getElementById("Text");
let result = textElement.innerHTML;
let lastCharacter = result.charAt(result.length - 1);
if (lastCharacter !== "+" && lastCharacter !== "-"){
textElement.innerHTML += "-"
} else {
alert("You cannot enter two signs in a row! ");
}

//Calculate button
let textElement = document.getElementById("Text");
let buttonCalculate = document.getElementById("BS");
let expression = textElement.textContent.trim();

if (expression.length > 10) {
    alert("The limit is exceeded, the length of the expression will be cut to 8");
    expression = expression.substring(0, 8);
    textElement.innerHTML = expression;
} else {
    expression = expression.replace(/[^0-9+\-*/()]/g, '');

    let isValid = /^-?\d+(\s*[\+\-\*\/]\s*-?\d+)*$/.test(expression);

    if (expression !== "" && isValid) {
        try {
            let result = eval(expression);

            textElement.textContent = result;
        } catch (error) {
            alert("Invalid calculation! Please check your input.");
        }
    } else {
        alert("Invalid input! Only numbers, +, -, *, /, and parentheses are allowed.");
    }
}

