public class Follower implements Observer {

    private String followerName;

    public Follower(String name) {
        this.followerName = name;
    }

    @Override
    public void update(String status) {
        System.out.println("New Status: " + status);
    }

    public void play() {
        System.out.println("Playing");
    }

    public String getFollowerName() {
        return followerName;
    }

    public void setFollowerName(String followerName) {
        this.followerName = followerName;
    }
}