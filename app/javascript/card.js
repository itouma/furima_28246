const pay = () => {
  Payjp.setPublicKey(// テスト公開鍵);
  
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
      }
    });
  });
};


window.addEventListener("Load",pay);


// <%= form_with  url: orders_path, id: 'charge-form', class: 'card-form',local: true do |f| %>
//   <div class='form-wrap'>
//     <%= f.label :price, "金額" %>
//     <%= f.text_field :price, class:"price", placeholder:"例)2000" %>
//   </div>
//   <div class='form-wrap'>
//     <%= f.label :number,  "カード番号" %>
//     <%= f.text_field :number, class:"number", placeholder:"カード番号(半角英数字)", maxlength:"16" %>
//   </div>
//   <div class='form-wrap'>
//     <%= f.label :cvc ,"ＣＶＣ" %>
//     <%= f.text_field :cvc, class:"cvc", placeholder:"カード背面4桁もしくは3桁の番号", maxlength:"3" %>
//   </div>
//   <div class='form-wrap'>
//     <p>有効期限</p>
//     <div class='input-expiration-date-wrap'>
//       <%= f.text_field :exp_month, class:"exp_month", placeholder:"例)3" %>
//       <p>月</p>
//       <%= f.text_field :exp_year, class:"exp_year", placeholder:"例)24" %>
//       <p>年</p>
//     </div>
//   </div>
//   <%= f.submit "購入" ,class:"button" %>
// <% end %>