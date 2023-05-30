<div class="dashboard">
    <div class="dashboard__title">
        <img src="${path}/images/dashboard.svg" alt="dashboard">
        <span>
           <a href="/">Dashboard</a>
        </span>
    </div>

    <div class="dashboard__accordion">
        <div class="tabs">
            <div class="tab">
                <input type="checkbox" id="rd1">
                <label class="tab-label dashboard__transfers transfers" for="rd1">
                    <img src="${path}/images/transfers.svg" alt="transfers">
                    <span>Transfers</span>
                </label>
                <div class="tab-content">
                    <fieldset>
                        <div class="transfers__radio">
                            <input type="radio" id="rb1" name="transfers__radio">
                            <div class="radio-button"></div>

                            <label class="transfers-label" for="rb1">
                                <a href="${path}/transaction/">Standard</a>
                            </label>

                        </div>
                        <div class="transfers__radio">
                            <input type="radio" id="rb2" name="transfers__radio">
                            <div class="radio-button"></div>
                            <label class="transfers-label" for="rb2">
                                <a href="${path}/transaction/currency">Currency</a>
                            </label>
                        </div>
                        <div class="transfers__radio">
                            <input type="radio" id="rb3" name="transfers__radio">
                            <div class="radio-button"></div>
                            <label class="transfers-label" for="rb3">
                                <a href="${path}/transaction/template">Templates</a>
                            </label>
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="tab">
                <input type="checkbox" id="rd2" name="rd">
                <label class="tab-label  dashboard__exchange" for="rd2">
                    <img src="${path}/images/exchange.svg" alt="exchange">
                    <span>Exchange</span>
                </label>
                <div class="tab-content">
                    <fieldset>
                        <div class="transfers__radio">
                            <input type="radio" name="transfers__radio">
                            <div class="radio-button"></div>

                            <label class="transfers-label" for="rb1">
                                <a href="${path}/exchangecurrency/">Currency exchange</a>
                            </label>

                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="tab">
                <input type="checkbox" id="rd3" name="rd">
                <label class="tab-label  dashboard__credit" for="rd3">
                    <img src="${path}/images/credit.svg" alt="credit">
                    <span>Credit</span>
                </label>
                <div class="tab-content">
                    <fieldset>
                        <div class="transfers__radio">
                            <input type="radio" name="transfers__radio">
                            <div class="radio-button"></div>
                            <label class="transfers-label" for="rb1">
                                <a href="${path}/credits/">New credit</a>
                            </label>
                        </div>

                        <div class="transfers__radio">
                            <input type="radio" name="transfers__radio">
                            <div class="radio-button"></div>
                            <label class="transfers-label" for="rb2">
                                <a href="${path}/credits/user-credits">My credits</a>
                            </label>
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="tab">
                <input type="checkbox" id="rd5" name="rd">
                <label class="tab-label  dashboard__credit" for="rd3">
                    <img src="${path}/images/deposit.svg" alt="credit">
                    <span>Deposit</span>
                </label>
                <div class="tab-content">
                    <fieldset>
                        <div class="transfers__radio">
                            <input type="radio" name="transfers__radio">
                            <div class="radio-button"></div>
                            <label class="transfers-label" for="rb1">
                                <a href="${path}/investments/">New deposit</a>
                            </label>
                        </div>

                        <div class="transfers__radio">
                            <input type="radio" name="transfers__radio">
                            <div class="radio-button"></div>
                            <label class="transfers-label" for="rb2">
                                <a href="${path}/investments/user-deposits">My deposits</a>
                            </label>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <div class="dashboard__notification">
        <img src="${path}/images/notification.svg" alt="notification">
        <span>
          <a href="${path}/conversations">Support</a>
        </span>
    </div>
    <div class="dashboard__profile">
        <img src="${path}/images/profile.svg" alt="profile">
        <span>
          <a href="${path}/user/profile">Profile</a>
        </span>
    </div>
</div>