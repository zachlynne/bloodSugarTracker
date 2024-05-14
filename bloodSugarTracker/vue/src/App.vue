<template>
  <div id="diabetes-app">
    <div id="nav" class="bg-gray-500">
      <router-link class="font-fun ml-2" v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link class="font-fun" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>