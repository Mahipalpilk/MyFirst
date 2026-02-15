public class AccountServiceSolid {

    private IEmailService emailService;
    private ILogger logger;
    private IAccountValidator validator;


    // Constructor Injection (Dependency Injection)
    public AccountServiceSolid(
        IEmailService emailService,
        ILogger logger,
        IAccountValidator validator
    ){
        this.emailService = emailService;
        this.logger = logger;
        this.validator = validator;
    }

    public void createAccount(Account acc) {

        try {
            validator.validate(acc);

            insert acc;

            emailService.sendAccountCreatedEmail(acc);

            logger.log('Account Created '+acc.id, 'Success', 'Account created successfully');

        } catch(Exception e) {

            logger.log('Account Creation Failed', 'Error', e.getMessage());
            throw e;
        }
}
}
/*
Use in EA Window    
IEmailService emailService = new EmailService();
ILogger logger = new AccountLogger();
AccountValidator validator = new AccountValidator();

AccountServiceSolid service = new AccountServiceSolid(
    emailService,
    logger,
    validator
);

Account acc = new Account(Name='SRP Demo');
service.createAccount(acc);

*/