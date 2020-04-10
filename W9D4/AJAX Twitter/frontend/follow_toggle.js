const APIUtil = require('./api_util.js');

class FollowToggle {
    constructor(el) {
        this.$el = $(el);
        this.userId = $(el).data("user-id");
        this.followState = $(el).data("initial-follow-state");
        this.render();
        this.handleClick();
    }

    render(){
        if (this.followState === false){
            this.$el.text("Follow!");
        } else if (this.followState === true){
            this.$el.text("Unfollow!");
        }
    }

    handleClick(){
        this.$el.on("click", (e) => {
            let that = this;
            e.preventDefault();
            if (this.followState === true){
                APIUtil.unfollowUser(that);
            } else {
                APIUtil.followUser(that);
            }
        });
    }
}

module.exports = FollowToggle;