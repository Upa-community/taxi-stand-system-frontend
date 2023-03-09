<template>
    <LoginForm class="mx-auto" />
</template>

<script>
import LoginForm from "~/components/Auth/LoginForm.vue";
export default {
    layout: "LoginLayout",
    components: {
        LoginForm
    },
};
</script>