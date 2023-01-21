import java.util.ArrayList;

public class Channel implements Subject {

    final private ArrayList<Observer> observers;
    private String channelName;
    private String status;

    public Channel(String name, String status) {
        this.channelName = name;
        this.status = status;
        observers = new ArrayList<>();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
        this.notifyObservers();
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    @Override
    public void registerObserver(Observer observer) {
        observers.add(observer);
    }

    @Override
    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }

    @Override
    public void notifyObservers() {
        for (Observer observer : observers) {
            observer.update(this.status);
        }
    }

}