public class AccountValidator implements IAccountValidator {
    public void validate(Account acc) {
        if(String.isBlank(acc.Name)) {
            throw new IllegalArgumentException('Name required');
        }
    }
}