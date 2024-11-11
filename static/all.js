const buttons = document.getElementsByClassName("button");

for (const button of buttons) {
  let count = 0;
  button.addEventListener("click", () => {
    count++;
    button.innerText = "Added " + count;
  });
}
