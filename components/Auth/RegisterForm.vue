<template>
    <v-container>
        <v-card style="background: #ffffff;">
            <v-col cols="12">
                <h2>新規登録</h2>
                <v-form @submit.prevent="registerUser">
                    <v-text-field
                        v-model="user.name"
                        label="ユーザー名"
                    ></v-text-field>
                    <v-text-field
                        v-model="user.email"
                        label="メールアドレス"
                    ></v-text-field>
                    <v-text-field
                        v-model="user.password"
                        type="password"
                        label="パスワード"
                    ></v-text-field>
                </v-form>
                <v-row>
                    <v-col cols="10">
                        <v-btn
                            block
                            color="#00E5FF"
                            @click="onClickRegisterButton()"
                        >
                            新規登録
                        </v-btn>
                    </v-col>
                    <v-col cols="2">
                        <v-btn
                            block
                            outlined
                            color="#00E5FF" 
                            @click="onClickTransitionLoginButton()"
                        >
                            ログイン
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
                name: "",
                email: "",
                password: ""
            }
        }
    },
    methods:{
        async onClickRegisterButton() {
            this.$axios.post("/api/register", this.user)
            .then((response) => {
                this.$auth.loginWith("local", {
                    data: this.user
                })
            })
        },
        async onClickTransitionLoginButton() {
            this.$router.push("/auth/login");
        }
    }
}
</script>