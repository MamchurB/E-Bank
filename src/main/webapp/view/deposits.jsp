<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>E-Bank - Deposits</title>
   <link rel="stylesheet" href="../../../../../../../../Desktop/Bodya/project/css/style.css">
</head>

<body>
   <div class="wrapper">
      <header class="header">
         <div class="container">
            <div class="header__body">
               <a href="" class="header__logo">E-bank</a>
               <div class="header__burger">
                  <span></span>
               </div>
               <nav class="header__menu">
                  <ul class="header__list">
                     <li><a href="" class="header__link">HOME</a></li>
                     <li><a href="" class="header__link">ABOUT US</a></li>
                     <li><a href="" class="header__link">CONTACTS</a></li>
                  </ul>
               </nav>
            </div>
         </div>
      </header>
      <div class="popup__wrapper">
         <div class="popup popup__deposit popup-deposits">
            <div class="card-details__transactions transactions-card-details">
               <div class="popup-deposits__row">
                  <div class="popup-deposits__title">
                     Види банківський рахунків
                  </div>
                  <button class="form-button popup__button popup-deposits__close-deposit">
                     Закінчити депозит
                  </button>
               </div>
               <div class="transactions-card-details__table_wrapper">
                  <table class="transactions-card-details__table statistic__table">
                     <tr>
                        <th>ID</th>
                        <td>5</td> 
                     </tr> 
                     <tr>
                        <th>Сплачено</th>
                        <td>0.00</td> 
                     </tr>
                     <tr>
                        <th>Сума Внеску</th>
                        <td>166.67</td> 
                     </tr>
                     <tr>
                        <th>РОзмір позики</th>
                        <td>1000</td> 
                     </tr>
                     <tr>
                        <th>Валюта</th>
                        <td>Грн</td> 
                     </tr> 
                     <tr>
                        <th>Статус</th>
                        <td>В очікуванні</td> 
                     </tr> 
                  </table>
               </div>
            </div>
            <button class="form-button popup__button popup__close popup-deposits__button">
               Ок
            </button>
         </div>
      </div>
      <main class="page page_index">
         <div class="dashboard">
            <div class="dashboard__title">
               <img src="../../../../../../../../Desktop/Bodya/project/images/dashboard.svg" alt="dashboard">
               <span>Dashboard</span>
            </div>

            <div class="dashboard__accordion">
               <div class="tabs">
                  <div class="tab">
                     <input type="checkbox" id="rd1">
                     <label class="tab-label dashboard__transfers transfers" for="rd1">
                        <img src="../../../../../../../../Desktop/Bodya/project/images/transfers.svg" alt="transfers">
                        <span>Transfers</span>
                     </label>
                     <div class="tab-content">
                        <fieldset>
                           <div class="transfers__radio">
                              <input type="radio" id="rb1" name="transfers__radio">
                              <div class="radio-button"></div>
                              <label class="transfers-label" for="rb1">
                                 Стандартний
                              </label>
                           </div>
                           <div class="transfers__radio">
                              <input type="radio" id="rb2" name="transfers__radio">
                              <div class="radio-button"></div>
                              <label class="transfers-label" for="rb2">
                                 Валютний
                              </label>
                           </div>
                           <div class="transfers__radio">
                              <input type="radio" id="rb3" name="transfers__radio">
                              <div class="radio-button"></div>
                              <label class="transfers-label" for="rb3">
                                 Визначені трансфери
                              </label>
                           </div>
                        </fieldset>
                     </div>
                  </div>
                  <div class="tab">
                     <input type="checkbox" id="rd2" name="rd">
                     <label class="tab-label  dashboard__exchange" for="rd2">
                        <img src="../../../../../../../../Desktop/Bodya/project/images/exchange.svg" alt="exchange">
                        <span>Exchange</span>
                     </label>
                     <div class="tab-content">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nihil, aut.
                     </div>
                  </div>
                  <div class="tab">
                     <input type="checkbox" id="rd3" name="rd">
                     <label class="tab-label  dashboard__credit" for="rd3">
                        <img src="../../../../../../../../Desktop/Bodya/project/images/credit.svg" alt="credit">
                        <span>Credit</span>
                     </label>
                     <div class="tab-content">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nihil, aut.
                     </div>
                  </div>
               </div>
            </div>
            <div class="dashboard__notification">
               <img src="../../../../../../../../Desktop/Bodya/project/images/notification.svg" alt="notification">
               <span>Notifications</span>
            </div>
            <div class="dashboard__profile">
               <img src="../../../../../../../../Desktop/Bodya/project/images/profile.svg" alt="profile">
               <span>Profile</span>
            </div>
         </div>
         <div class="data message">
            <div class="form-title message__title">
               Deposit
            </div>
            <div class="transactions-card-details__title">
               Add a new deposit
            </div>
            <div class="data__form">
               <div class="data__bank-account">
                  <div class="data__label">Select a bank account
                  </div>
                  <select>
                     <option value="">Account 1</option>
                     <option value="">Account 2</option>
                     <option value="">Account 3</option>
                  </select>
               </div>
               <div class="data__out-currency deposit__out-currency">
                  <div class="data__label">Currency
                  </div>
                  <select>
                     <option value="">Currency 1</option>
                     <option value="">Currency 2</option>
                     <option value="">Currency 3</option>
                  </select>
               </div>
               <div class="data__sum exchange__sum">
                  <div class="data__label">Sum
                  </div>
                  <input type="number" placeholder="Сума">
               </div>
               <button class="data__button form-button deposit__button">
                  Apply
               </button>
            </div>
            <div class="transactions-card-details__title">
               Депозити
            </div>
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__table_wrapper transfer-tempalte__table">
                  <table class="transactions-card-details__table message__table">
                     <tr>
                        <th>Сума</th>
                        <th>Дата</th>
                        <th>Номер рахунку</th>
                     </tr>
                     <tr>
                        <td>123</td>
                        <td>16.05.2023</td>
                        <td>1234 5678 9012 2312</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>123</td>
                        <td>16.05.2023</td>
                        <td>1234 5678 9012 2312</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>123</td>
                        <td>16.05.2023</td>
                        <td>1234 5678 9012 2312</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>123</td>
                        <td>16.05.2023</td>
                        <td>1234 5678 9012 2312</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>123</td>
                        <td>16.05.2023</td>
                        <td>1234 5678 9012 2312</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>123</td>
                        <td>16.05.2023</td>
                        <td>1234 5678 9012 2312</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                  </table>
               </div>
            </div>
            <div class="transactions-card-details__title">
               Банківські рахунки
            </div>
            <div class="card-details__transactions transactions-card-details">
               <div class="transactions-card-details__table_wrapper transfer-tempalte__table">
                  <table class="transactions-card-details__table message__table">
                     <tr>
                        <th>Номер рахунку</th>
                        <th>Тип</th>
                        <th>Рахунки</th>
                     </tr>
                     <tr>
                        <td>1234 5678 9012 2312</td>
                        <td>Student</td>
                        <td>50 ГРН</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>1234 5678 9012 2312</td>
                        <td>Student</td>
                        <td>50 ГРН</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>1234 5678 9012 2312</td>
                        <td>Student</td>
                        <td>50 ГРН</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>1234 5678 9012 2312</td>
                        <td>Student</td>
                        <td>50 ГРН</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>1234 5678 9012 2312</td>
                        <td>Student</td>
                        <td>50 ГРН</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>1234 5678 9012 2312</td>
                        <td>Student</td>
                        <td>50 ГРН</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                     <tr>
                        <td>1234 5678 9012 2312</td>
                        <td>Student</td>
                        <td>50 ГРН</td>
                        <td>
                           <button class="form-button message__history-btn">
                              Детально
                           </button>
                        </td>
                     </tr>
                  </table>
               </div>
            </div>
         </div>
      </main>
      <footer class="footer">
         <div class="container container_footer">
            <div class="footer__inner">
               <ul class="footer__social">
                  <li>
                     <a href="#"><img src="../../../../../../../../Desktop/Bodya/project/images/facebook.svg" alt="facebook"></a>
                  </li>
                  <li><a href="#"><img src="../../../../../../../../Desktop/Bodya/project/images/inst.svg" alt="inst"></a></li>
                  <li><a href="#"><img src="../../../../../../../../Desktop/Bodya/project/images/youtube.svg" alt="youtube"></a></li>
                  <li><a href="#"><img src="../../../../../../../../Desktop/Bodya/project/images/viber.svg" alt="viber"></a></li>
                  <li><a href="#"><img src="../../../../../../../../Desktop/Bodya/project/images/telega.svg" alt="telega"></a></li>
               </ul>
               <div class="footer__rights">
                  "E-Bank", 2023. All rights reserved. CrEATEd by Bohdan Mamchur
               </div>
            </div>
         </div>
      </footer>
   </div>


   <script src="../../../../../../../../Desktop/Bodya/project/js/burger.js"></script>
   <script src="../../../../../../../../Desktop/Bodya/project/js/popup-deposits.js"></script>
</body>

</html>