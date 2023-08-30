const userInput = "<script>alert('XSS Attack');</script>";
const message = `Hello, ${userInput}!`;

document.getElementById("output").innerHTML = message;
