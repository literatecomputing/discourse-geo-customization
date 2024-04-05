import User from "discourse/models/user";

export default {
    currentUser: User.current()
};
