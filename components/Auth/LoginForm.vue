<template>
    <v-container>
        <v-card>
            <v-col cols="12">
                <h2>Login</h2>
                <v-form @submit.prevent="loginUser">
                    <v-text-field
                        v-model="user.email"
                        label="Email"
                    ></v-text-field>
                    <v-text-field
                        v-model="user.password"
                        label="Password"
                    ></v-text-field>
                    <v-btn
                        color="success"
                        class="mt-4"
                        block
                        @click="onClickLoginButton()"
                    >
                        Login
                    </v-btn>
                </v-form>
            </v-col>
        </v-card>      
    </v-container>
</template>

<script>
export default {
    data() {
        return {
            user:{
                email: "",
                password: ""
            }
        }
    },
    methods:{
        onClickLoginButton() {
            this.$auth.loginWith("local", {
                data:this.user
            })
            .then(() => {
                this.$router.push("/home");
            });
        },
    }
}
</script>