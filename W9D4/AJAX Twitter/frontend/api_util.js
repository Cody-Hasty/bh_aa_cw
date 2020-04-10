

const APIUtil = {
    followUser: that => {
        $.ajax(`/users/${that.$el.data("user-id")}/follow`, {
            type: "POST",
            dataType: "JSON",
            success(data) {
                that.followState = true;
                that.render();
            },
            error() {
                console.log("Follow error");
            }
        });
    },

    unfollowUser: that => {
        $.ajax( `/users/${that.$el.data("user-id")}/follow`, {
            type: "DELETE",
            dataType: "JSON",
            success(data){
                that.followState = false;
                that.render();
            },
            error() {
                console.log("Unfollow error");
            }
        });
    }
};

module.exports = APIUtil;