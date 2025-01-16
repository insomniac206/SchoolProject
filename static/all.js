const buttons = document.getElementsByClassName("button");

let url = window.location.href.split("/");
let page_name = url[url.length - 1];

const db_map = {
  Vegetables: "VegFruit",
  DPM: "DPM",
  Bakery: "Bakery",
  Stationery: "Stationery",
  SelfCare: "SelfCare",
};

async function getData(url) {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Response status: ${response.status}`);
    }

    const json = await response.json();
    return json;
  } catch (error) {
    console.error(error.message);
  }
}

let data = {};
let items = {};
let price = {};

if (page_name in db_map) {
  let loc_array = window.location.href.split("/");
  loc_array.splice(loc_array.indexOf(loc_array.at(-1)), 1);
  const url =
    loc_array.join("/") +
    "/get-data?db=greenbasket_eshop&table=" +
    db_map[page_name];

  result = getData(url).then((result) => {
    data = result;
    for (i = 0; i < data["rows"]; i++) {
      items[data[i.toString()][1]] = 0;
      price[data[i.toString()][1]] = data[i.toString()][2];
    }
  });
}

if (localStorage.getItem("cart") === null) {
  local_cart = {};
} else {
  local_cart = JSON.parse(localStorage.getItem("cart"));
}

for (const button of buttons) {
  let count = 0;
  button.addEventListener("click", () => {
    count++;
    let name =
      button.parentNode.getElementsByClassName("item-name")[0].innerText;
    items[name] += 1;

    for (const item in items) {
      if (items[item] != 0) {
        local_cart[item] = {
          quantity: items[item],
          price: items[item] * price[item],
        };
      }
    }
    button.innerText = "Added " + count;

    localStorage.setItem("cart", JSON.stringify(local_cart));
  });
}
