<template>
    <div>
      <v-card>
        <div>
            <h2>ログイン状態:{{ $auth.loggedIn }}</h2>
            <p>{{ $auth.user }}</p>
        </div>
        <div v-if="$auth.loggedIn">
          <button @click="$auth.logout()">Logout</button>
        </div> 
        <v-byn @click="a()">
          aaa
        </v-byn>        
      </v-card>
    </div>
</template>

<script>
export default {
  name: "IndexPage",
  middleware: "auth",
}
</script>
