<template>
    <div id="login"  class="bg-no-repeat bg-cover bg-bottom bg-[url('src/assets/1295790.webp')] h-screen overflow-hidden flex items-center justify-center">
      
      <form v-on:submit.prevent="login" class="z-10 mx-auto my-auto bg-white lg:w-6/12 md:7/12 w-8/12 shadow-3xl rounded-xl p-12 md:p-24">
        <h1 class="font-fun underline text-center mb-3 text-2xl text-black uppercase w-full rounded">Please Sign In</h1>
        <div role="alert" v-if="invalidCredentials">
          Invalid username and password!
        </div>
        <div role="alert" v-if="this.$route.query.registration">
          Thank you for registering, please sign in.
        </div>
        <div class="form-input-group font-fun flex items-center text-lg mb-6 md:mb-8 ">
          <input type="text" id="username" class="bg-gray-200 rounded pl-12 py-2 md:py-4 focus:outline-none w-full" placeholder="Username" v-model="user.username" required autofocus />
        </div>
        <div class="form-input-group flex items-center text-lg mb-6 md:mb-8">
          <input type="password" id="password" class="font-fun bg-gray-200 rounded pl-12 py-2 md:py-4 focus:outline-none w-full" placeholder="Password" v-model="user.password" required />
        </div>
        <button type="submit" class="font-fun bg-gradient-to-b from-gray-700 to-gray-900 font-medium p-2 md:p-4 text-white uppercase w-full rounded">Sign in</button>
        <p class="font-fun font-medium p-2 md:p-4 text-black uppercase w-full rounded">
          <router-link v-bind:to="{ name: 'register' }">Need an account? Sign up!</router-link>
        </p>
      </form>
      <div
      class="absolute inset-y-40 top-52 inset-44 inset-x-1/4 bg-gradient-to-r from-slate-500 to-slate-900 shadow-lg transform -skew-y-0 sm:-skew-y-2 sm:-rotate-2 sm:rounded-3xl">
    </div>
    </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
.form-input-group {
  margin-bottom: 1rem;
}

label {
  margin-right: 0.5rem;
}
</style>