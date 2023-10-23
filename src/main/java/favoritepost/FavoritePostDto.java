package favoritepost;

public class FavoritePostDto {
    private int favotirepost_id;
    private String user_id;
    private int post_id;
    private int board_id;

    public int getFavotirepost_id() {
        return favotirepost_id;
    }

    public void setFavotirepost_id(int favotirepost_id) {
        this.favotirepost_id = favotirepost_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getBoard_id() {
        return board_id;
    }

    public void setBoard_id(int board_id) {
        this.board_id = board_id;
    }

}
