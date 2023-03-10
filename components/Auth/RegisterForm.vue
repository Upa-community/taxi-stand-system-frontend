<template>
    <v-container>
        <v-card>
            <v-col cols="12">
                <h2>Register</h2>
                <v-form @submit.prevent="registerUser">
                    <v-text-field
                        v-model="user.name"
                        label="Email"
                    ></v-text-field>
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
                        @click="registerUser()"
                    >
                        Join
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
            name: "",
            email: "",
            password: ""
            }
        }
    },
    methods:{
        registerUser() {
            this.$axios.post("/api/register",this.user)
            .then((response) => {
                this.$auth.loginWith("local", {
                data: this.user
                })
            })
        },
    }
}
</script>