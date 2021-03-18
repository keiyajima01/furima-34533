const item_price = () => { 
 const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    if (!isNaN(inputValue)) {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
      const priceContentDom = document.getElementById("profit");
      priceContentDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML)
    };
  });
};
window.addEventListener('load', item_price);