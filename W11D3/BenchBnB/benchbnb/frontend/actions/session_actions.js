export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_ERRORS";
import * as APIUtil from '../util/session_api_util'



export const receiveCurrentUser = (currentUser) => {
    return {
        type: RECEIVE_CURRENT_USER,
        currentUser
    }
}

export const logoutCurrentUser = () => {
    return {
        type: LOGOUT_CURRENT_USER
    }
}

export const receiveSessionErrors = (errors) => {
    return {
        type: RECEIVE_SESSION_ERRORS,
        errors
    }
}

export const login = (user) => dispatch => {
    return APIUtil.postSession(user)
        .then(currentUser => dispatch(receiveCurrentUser(currentUser)))
}

export const logout = () => dispatch => {
    return APIUtil.deleteSession()
        .then(() => dispatch(logoutCurrentUser()))
}

export const signup = (user) => dispatch => {
    return APIUtil.postUser(user)
        .then(currentUser => dispatch(receiveCurrentUser(currentUser)))
}