import axios from 'axios'

const baseUrl = import.meta.env.VITE_BASE_URL + "/api/v1"

export const list = () => {
    return axios.get(`${baseUrl}/todos`)
}

export const show = (id) => {
    return axios.get(`${baseUrl}/todos/${id}`)
}

export const save = (data) => {
    return axios.post(`${baseUrl}/todos`, data)
}

export const update = (id, data) => {
    return axios.put(`${baseUrl}/todos/${id}`, data)
}

export const destroy = (id) => {
    return axios.delete(`${baseUrl}/todos/${id}`)
}