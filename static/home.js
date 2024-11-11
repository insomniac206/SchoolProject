const dict = {
  "Vegetables and Fruits": "Vegetables",
  "Dairy, Poultry and Meat": "DPM",
  "Baked Goods and Snacks": "Bakery",
  Stationery: "Stationery",
  "Self Care": "SelfCare",
};

const aisles = document.getElementsByClassName("Aisle");

for (const aisle of aisles) {
  aisle.addEventListener("click", () => {
    aisle_name = aisle.innerText.split("\n")[0];
    window.location.href = dict[aisle_name];
  });
}
