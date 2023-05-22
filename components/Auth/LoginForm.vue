<template>
    <v-container>
        <v-card style="background: #ffffff;">
            <v-col cols="12">
                <h2>ログイン</h2>
                <v-form @submit.prevent="loginUser">
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
                            @click="onClickLoginButton()"
                        >
                            ログイン
                        </v-btn>
                    </v-col>
                    <v-col cols="2">
                        <v-btn
                            block
                            outlined
                            color="#00E5FF" 
                            @click="onClickTransitionRegisterButton()"
                        >
                            新規登録
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
                this.onLoadhomeData();
                this.$router.push("/home");
            });
        },
        async onClickTransitionRegisterButton() {
            this.$router.push("/auth/register");
        },
        async onLoadhomeData() {
            this.$store.dispatch("homeData/onLoadhomeData", {
                usersId: this.$auth.user.id
            });
        }
    }
}
</script>