export const constructor = (body) => new Response(body);

export const clone = (request) => request.clone();
export const json = (request) => request.json();
export const redirect = (request) => request.redirect();

export const arrayBuffer = (request) => request.arrayBuffer();
export const formData = (request) => request.formData();
export const text = (request) => request.text();
