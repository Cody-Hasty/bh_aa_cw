const FollowToggle = require("./follow_toggle");

$(document).ready(function() {
    jQuery.each($('.follow-toggle'), function(i, x) {
        new FollowToggle(x);
    });
});
