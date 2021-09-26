onPageLoad 'items', ->
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener('keyup', () => {
    addTaxPrice.value = Math.floor(itemPrice.value * 0.1)
    addTaxPrice.innerHTML = (addTaxPrice.value)
    profit.value = itemPrice.value - addTaxPrice.value
    profit.innerHTML = profit.value
  })
 };
 
 