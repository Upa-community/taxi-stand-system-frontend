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
                </v-form>
                <v-row>
                    <v-col cols="10">
                        <v-btn
                            block
                            color="success"
                            @click="onClickLoginButton()"
                        >
                            Login
                        </v-btn>
                    </v-col>
                    <v-col cols="2">
                        <v-btn
                            block
                            outlined
                            color="success" 
                            @click="onClickTransitionRegisterButton()"
                        >
                            Sign up
                        </v-btn>                          
                    </v-col>
                </v-row>
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
        async onClickLoginButton() {
            this.$auth.loginWith("local", {
                data:this.user
            })
            .then(() => {
                this.$router.push("/home");
            });
        },
        async onClickTransitionRegisterButton() {
            this.$router.push("/auth/register");
        }
    }
}
</script>