import * as Main from "../output/Main/index.js";

export default {
  fetch(request, environment, context) {
    return Main.fetch(request)(environment)(context)();
  }
};
