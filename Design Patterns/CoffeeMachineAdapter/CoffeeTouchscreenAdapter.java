public class CoffeeTouchscreenAdapter implements CoffeeMachineInterface {

    private OldCoffeeMachine oldCoffeeMachine;

    public CoffeeTouchscreenAdapter() {
        oldCoffeeMachine = new OldCoffeeMachine();
    }

    public CoffeeTouchscreenAdapter(OldCoffeeMachine oldCoffeeMachine) {
        this.oldCoffeeMachine = oldCoffeeMachine;
    }

    @Override
    public void chooseFirstSelection() {
        oldCoffeeMachine.selectA();
    }

    @Override
    public void chooseSecondSelection() {
        oldCoffeeMachine.selectB();
    }

}