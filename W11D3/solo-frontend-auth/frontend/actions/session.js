// part 2

import {postUser, deleteSession, postSession} from '../utils/session'

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';

const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    
    // this is the payload variable we recieve back
    user,
})

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
});

// formUser is from the html (our code), dispatch is from middleware (not our code)
export const createNewUser = formUser => dispatch => postUser(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));

export const login = formUser => dispatch => postSession(formUser)
    .then(user => dispatch(receiveCurrentUser(user)));

export const logout = () => dispatch => deleteSession()
    .then(() => dispatch(logoutCurrentUser()));