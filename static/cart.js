container = document.getElementById("item-container");
button = document.getElementsByTagName("button")[0];

button.addEventListener("click", () => {
  fetch("/place_order", {
    method: "POST",
    headers: {
      "Content-type": "application/json",
    },
    body: JSON.stringify(localStorage.getItem("cart")),
  })
    .then((response) => response.json)
    .then(() => {
      window.location.href = "/";
      localStorage.setItem("cart", JSON.stringify({}));
    });
});

if (localStorage.getItem("cart") === null) {
  data = {};
} else {
  data = JSON.parse(localStorage.getItem("cart"));
}

for (key in data) {
  main = document.createElement("tr");

  item_name = document.createElement("td");
  item_name.innerText = key;
  main.append(item_name);
  quantity = data[key]["quantity"];
  price = data[key]["price"];

  qty_element = document.createElement("td");
  qty_element.innerText = quantity;
  price_element = document.createElement("td");
  price_element.innerText = price;

  main.append(qty_element);
  main.append(price_element);

  container.append(main);
}
