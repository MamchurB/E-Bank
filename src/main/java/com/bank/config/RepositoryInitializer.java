package com.bank.config;

import com.bank.models.*;
import com.bank.models.enums.*;
import com.bank.models.user.Address;
import com.bank.models.user.User;
import com.bank.models.user.UserRole;
import com.bank.repositories.*;
import com.bank.utils.Constants;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.*;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Collectors;

@Configuration
public class RepositoryInitializer {
    private final BankAccountRepository bankAccountRepository;

    private final CurrencyTypeRepository currencyTypeRepository;

    private final SaldoRepository saldoRepository;

    private final BankAccountTypeRepository bankAccountTypeRepository;

    private final Constants constants;

    private final UserRoleRepository userRoleRepository;

    private final UserRepository userRepository;

    private final AddressRepository addressRepository;

    private final CreditStatusRepository creditStatusRepository;

    private final BCryptPasswordEncoder encoder;

    @Autowired
    private ConversationStatusRepository conversationStatusRepository;

    @Autowired
    private ConversationDirectionRepository conversationDirectionRepository;

    @Autowired
    private InvestmentTypeRepository investmentTypeRepository;

    @Autowired
    private InvestmentRepository investmentRepository;

    @Autowired
    public RepositoryInitializer(BankAccountRepository bankAccountRepository,
                                 CurrencyTypeRepository currencyTypeRepository,
                                 SaldoRepository saldoRepository,
                                 BankAccountTypeRepository bankAccountTypeRepository,
                                 Constants constants,
                                 UserRoleRepository userRoleRepository,
                                 UserRepository userRepository,
                                 AddressRepository addressRepository,
                                 CreditStatusRepository creditStatusRepository,
                                 BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.bankAccountRepository = bankAccountRepository;
        this.currencyTypeRepository = currencyTypeRepository;
        this.saldoRepository = saldoRepository;
        this.bankAccountTypeRepository = bankAccountTypeRepository;
        this.constants = constants;
        this.userRoleRepository = userRoleRepository;
        this.userRepository = userRepository;
        this.addressRepository = addressRepository;
        this.creditStatusRepository = creditStatusRepository;
        this.encoder = bCryptPasswordEncoder;
    }
    @Bean
    public InitializingBean intializeRepo() {
        return () -> {

            if (userRoleRepository.findAll().isEmpty()) {
                userRoleRepository.save(UserRole.builder().userType(UserRole.UserType.ROLE_EMPLOYEE).build());
                userRoleRepository.save(UserRole.builder().userType(UserRole.UserType.ROLE_USER).build());
                userRoleRepository.save(UserRole.builder().userType(UserRole.UserType.ROLE_ADMIN).build());
            }

            if (userRepository.findAll().isEmpty()) {
                Address address = Address.builder()
                    .city("Lviv")
                    .houseNumber("10")
                    .name("Artem")
                    .surname("Koval")
                    .phoneNumber("662003004")
                    .postCode("03-100")
                    .dateOfBirth(Instant.now())
                    .street("Zen")
                    .build();

                User user = User.builder()
                    .credentials(false)
                    .email("koval@gmail.com")
                    .enabled(true)
                    .expired(false)
                    .locked(false)
                    .password(encoder.encode("bohdan123"))
                    .userRoles(Collections.singleton(userRoleRepository.findByUserType(UserRole.UserType.ROLE_ADMIN)))
                    .transactionTemplates(new HashSet<>())
                    .identifier("11111111")
                    .bankAccounts(new HashSet<>())
                    .address(address)
                    .build();

                userRepository.save(user);

                Address address2 = Address.builder()
                    .city("Lviv")
                    .houseNumber("32")
                    .name("Bohdan")
                    .surname("Mamchur")
                    .phoneNumber("521033104")
                    .postCode("60-201")
                    .dateOfBirth(Instant.now())
                    .street("Shevchenko")
                    .build();


                User user2 = User.builder()
                    .credentials(false)
                    .email("mamchur@gmail.com")
                    .enabled(true)
                    .expired(false)
                    .locked(false)
                    .password(encoder.encode("bohdan123"))
                    .userRoles(Collections.singleton(userRoleRepository.findByUserType(UserRole.UserType.ROLE_USER)))
                    .transactionTemplates(new HashSet<>())
                    .identifier("22222222")
                    .bankAccounts(new HashSet<>())
                    .address(address2)
                    .build();

                userRepository.save(user2);

                Address address3 = Address.builder()
                    .city("Kharkiv")
                    .houseNumber("92")
                    .name("Yuriy")
                    .surname("Buchkovsky")
                    .dateOfBirth(Instant.now())
                    .phoneNumber("692193823")
                    .postCode("50-221")
                    .street("Pokrivtsi")
                    .build();

                User user3 = User.builder()
                    .credentials(false)
                    .email("buchkovsky@gmail.com")
                    .enabled(true)
                    .expired(false)
                    .locked(false)
                    .password(encoder.encode("bohdan123"))
                    .userRoles(Collections.singleton(userRoleRepository.findByUserType(UserRole.UserType.ROLE_EMPLOYEE)))
                    .transactionTemplates(new HashSet<>())
                    .identifier("33333333")
                    .bankAccounts(new HashSet<>())
                    .address(address3)
                    .build();

                userRepository.save(user3);
            }

            if (currencyTypeRepository.findAll().isEmpty()) {
                Date date = new Date();
                LocalDate localdate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                String data = null;
                StringBuilder responseData = new StringBuilder();
                JsonArray jsonObject = null;
                URL url = null;
                url = new URL("https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?date=" + localdate.getYear() + "0" + localdate.getMonthValue() + localdate.getDayOfMonth() + "&json");
                HttpURLConnection con = (HttpURLConnection) url.openConnection();
                con.setRequestMethod("GET");
                con.setRequestProperty("User-Agent", "Mozilla/5.0");
                int responseCode = con.getResponseCode();
                System.out.println("\nSending 'GET' request to URL : " + url);
                // System.out.println("Response Code : " + responseCode);
                try (BufferedReader in = new BufferedReader(
                        new InputStreamReader(con.getInputStream()))) {
                    String line;
                    while ((line = in.readLine()) != null) {
                        responseData.append(line);
                    }
                    jsonObject = new Gson().fromJson(responseData.toString(), JsonArray.class);

                    data = jsonObject.get(0).toString();
                }
                float rateUSD = 0f;
                float rateEUR = 0f;
                float ratePLN = 0f;
                float rateGBP = 0f;
                for (int i = 0; i < jsonObject.size(); i++) {
                    JsonObject jsonObject1 = jsonObject.get(i).getAsJsonObject();
                    if(jsonObject1.get("cc").getAsString().equals("USD")){
                        rateUSD = jsonObject1.get("rate").getAsFloat();
                    }
                    if(jsonObject1.get("cc").getAsString().equals("EUR")){
                        rateEUR = jsonObject1.get("rate").getAsFloat();
                    }
                    if(jsonObject1.get("cc").getAsString().equals("PLN")){
                        ratePLN = jsonObject1.get("rate").getAsFloat();
                    }
                    if(jsonObject1.get("cc").getAsString().equals("GBP")){
                        rateGBP = jsonObject1.get("rate").getAsFloat();
                    }

                }
                CurrencyType uah = CurrencyType.builder()
                    .name("UAH")
                    .exchangeRate(1f)
                    .build();

                CurrencyType usd = CurrencyType.builder()
                    .name("USD")
                    .exchangeRate(rateUSD)
                    .build();

                CurrencyType eur = CurrencyType.builder()
                    .name("EUR")
                    .exchangeRate(rateEUR)
                    .build();

                CurrencyType pln = CurrencyType.builder()
                    .name("PLN")
                    .exchangeRate(ratePLN)
                    .build();

                CurrencyType gbp = CurrencyType.builder()
                    .name("GBP")
                    .exchangeRate(rateGBP)
                    .build();

                currencyTypeRepository.save(uah);
                currencyTypeRepository.save(pln);
                currencyTypeRepository.save(usd);
                currencyTypeRepository.save(eur);
                currencyTypeRepository.save(gbp);
            }

            if (bankAccountTypeRepository.findAll().isEmpty()) {
                BankAccType bankAccType = BankAccType.builder()
                    .bankAccountType(BankAccountType.MULTI_CURRENCY)
                    .exchangeCurrencyCommission((float) constants.CURRENCY_CONVERT_COMMISSION)
                    .transactionComission((float) constants.MULTI_CURRENCY_TRANSFER_COMMISSION)
                    .build();

                bankAccountTypeRepository.save(bankAccType);

                BankAccType bankAccType2 = BankAccType.builder()
                    .bankAccountType(BankAccountType.STANDARD)
                    .exchangeCurrencyCommission((float) constants.CURRENCY_CONVERT_COMMISSION)
                    .transactionComission((float) constants.SINGLE_CURRENCY_TRANSFER_COMMISSION)
                    .build();

                bankAccountTypeRepository.save(bankAccType2);

                BankAccType bankAccType3 = BankAccType.builder()
                    .bankAccountType(BankAccountType.STUDENT)
                    .exchangeCurrencyCommission((float) constants.CURRENCY_CONVERT_COMMISSION)
                    .transactionComission((float) constants.STUDENT_CURRENCY_TRANSFER_COMMISSION)
                    .build();

                bankAccountTypeRepository.save(bankAccType3);
            }

            if (bankAccountRepository.findAll().isEmpty()) {
                BankAccType single = bankAccountTypeRepository.findByBankAccountType(BankAccountType.STANDARD);
                BankAccType multi = bankAccountTypeRepository.findByBankAccountType(BankAccountType.MULTI_CURRENCY);
                BankAccType student = bankAccountTypeRepository.findByBankAccountType(BankAccountType.STUDENT);

                BankAccount bankAccount = BankAccount.builder()
                    .bankAccType(multi)
                    .number("12341234123412341234123412")
                    .removed(false)
                    .saldos(new HashSet<>())
                    .transactions(new HashSet<>())
                    .user(userRepository.findByIdentifier("11111111").get())
                    .build();

                bankAccountRepository.save(bankAccount);

                Set<Saldo> saldos = currencyTypeRepository.findAll()
                    .stream()
                    .map(e -> saldoRepository.save(Saldo.builder()
                        .balance(new BigDecimal(100f))
                        .currencyType(e)
                        .credits(new HashSet<>())
                        .bankAccount(bankAccount)
                        .build()))
                    .collect(Collectors.toSet());


                BankAccount bankAccount2 = BankAccount.builder()
                    .bankAccType(multi)
                    .number("67896789678967896789678967")
                    .removed(false)
                    .saldos(new HashSet<>())
                    .transactions(new HashSet<>())
                    .user(userRepository.findByIdentifier("11111111").get())
                    .build();

                bankAccountRepository.save(bankAccount2);

                Set<Saldo> saldos2 = currencyTypeRepository.findAll()
                    .stream()
                    .map(e -> saldoRepository.save(Saldo.builder()
                        .balance(new BigDecimal(100f))
                        .currencyType(e)
                        .bankAccount(bankAccount2)
                        .credits(new HashSet<>())
                        .build()))
                    .collect(Collectors.toSet());

                BankAccount bankAccount3 = BankAccount.builder()
                    .bankAccType(student)
                    .number("56785678567856785678567867")
                    .removed(false)
                    .saldos(new HashSet<>())
                    .transactions(new HashSet<>())
                    .user(userRepository.findByIdentifier("22222222").get())
                    .build();

                bankAccountRepository.save(bankAccount3);

                Set<Saldo> saldos3 = currencyTypeRepository.findAll()
                    .stream()
                    .filter(e -> Objects.equals(e.getName(), "PLN"))
                    .map(e -> saldoRepository.save(Saldo.builder()
                        .balance(new BigDecimal(100f))
                        .currencyType(e)
                        .credits(new HashSet<>())
                        .bankAccount(bankAccount3)
                        .build()))
                    .collect(Collectors.toSet());


            }

            if (creditStatusRepository.findAll().isEmpty()) {
                creditStatusRepository.save(CreditStatus.builder().creditType(CreditStatus.CreditType.ACTIVE).build());
                creditStatusRepository.save(CreditStatus.builder().creditType(CreditStatus.CreditType.AWAITING).build());
                creditStatusRepository.save(CreditStatus.builder().creditType(CreditStatus.CreditType.CANCELED).build());
                creditStatusRepository.save(CreditStatus.builder().creditType(CreditStatus.CreditType.PAID).build());
            }

            if (conversationDirectionRepository.findAll().isEmpty()) {
                conversationDirectionRepository.save(ConversationDirection.builder().conversationDirectionType(ConversationDirection.ConversationDirectionType.EMPLOYEE_TO_ADMIN).build());
                conversationDirectionRepository.save(ConversationDirection.builder().conversationDirectionType(ConversationDirection.ConversationDirectionType.USER_TO_EMPLOYEE).build());
            }

            if(conversationStatusRepository.findAll().isEmpty()){
                conversationStatusRepository.save(ConversationStatus.builder().conversationType(ConversationStatus.ConversationType.ACTIVE).build());
                conversationStatusRepository.save(ConversationStatus.builder().conversationType(ConversationStatus.ConversationType.DELETED).build());
                conversationStatusRepository.save(ConversationStatus.builder().conversationType(ConversationStatus.ConversationType.RESOLVED).build());
            }

            if(investmentTypeRepository.findAll().isEmpty()){
                investmentTypeRepository.save(InvestmentType.builder().investmentStatus(InvestmentType.InvestmentStatus.ACTIVE).build());
                investmentTypeRepository.save(InvestmentType.builder().investmentStatus(InvestmentType.InvestmentStatus.CLOSED).build());
            }

            if(investmentRepository.findAll().isEmpty()){
                Instant now = Instant.now();
                investmentRepository.save(Investment.builder().updateTimespan(now).creationDate(now).currency("PLN").currentBalance(BigDecimal.valueOf(150L)).startBalance(BigDecimal.valueOf(100L)).investmentType(investmentTypeRepository.findByInvestmentStatus(InvestmentType.InvestmentStatus.ACTIVE)).destinedSaldo(saldoRepository.findAll().get(0)).build());
                investmentRepository.save(Investment.builder().creationDate(now).updateTimespan(now).currency("PLN").currentBalance(BigDecimal.valueOf(150L)).startBalance(BigDecimal.valueOf(100L)).investmentType(investmentTypeRepository.findByInvestmentStatus(InvestmentType.InvestmentStatus.CLOSED)).destinedSaldo(saldoRepository.findAll().get(0)).build());
            }
        };

    }
}
