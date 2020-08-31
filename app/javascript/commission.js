window.addEventListener("load", function(){
  const item_price = document.getElementById("item-price");
  const tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  item_price.addEventListener('input',function(){
    const price = document.getElementById("item-price").value
    const price1 = price*0.1
    const price2 = price*0.9
    tax_price.innerHTML = Math.floor(price1, 0.1);
    profit.innerHTML = Math.floor(price2, 0.1);
  });
// function name() {
// } 

} )