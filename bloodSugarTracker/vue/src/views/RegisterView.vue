<template>
  <div id="register" class="text-center">
    <form v-on:submit.prevent="register" class="max-w-sm mx-auto">
      <h1 class="text-2xl font-bold mb-4">Create Account</h1>
      <div role="alert" v-if="registrationErrors" class="text-red-500 mb-4">
        {{ registrationErrorMsg }}
      </div>
      <div class="mb-4">
        <label for="username" class="block mb-2">Username</label>
        <input type="text" id="username" v-model="user.username" required autofocus class="w-full px-4 py-2 border rounded" />
      </div>
      <div class="mb-4">
        <label for="password" class="block mb-2">Password</label>
        <input type="password" id="password" v-model="user.password" required class="w-full px-4 py-2 border rounded" />
      </div>
      <div class="mb-4">
        <label for="confirmPassword" class="block mb-2">Confirm Password</label>
        <input type="password" id="confirmPassword" v-model="user.confirmPassword" required class="w-full px-4 py-2 border rounded" />
      </div>
      <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Create Account</button>
      <p class="mt-4"><router-link v-bind:to="{ name: 'login' }" class="text-blue-500">Already have an account? Log in.</router-link></p>
    </form>
  </div>

</template>

<script>
import authService from '../services/AuthService';

export default {
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
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
