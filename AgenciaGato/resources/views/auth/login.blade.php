<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | MediCare</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="flex items-center justify-center min-h-screen bg-gray-100">
    <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-md">
        <h1 class="text-2xl font-semibold text-center mb-6">Log in to MediCare</h1>

        @if(session('error'))
            <p class="text-red-500 text-center">{{ session('error') }}</p>
        @endif

        <form action="{{ route('login.post') }}" method="POST">
            @csrf

            <div class="mb-4">
                <label class="block text-gray-700" for="email">Email</label>
                <input class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    type="email" id="email" name="email" placeholder="Correo" required>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700" for="password">Password</label>
                <input class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    type="password" id="password" name="password" placeholder="Contraseña" required>
            </div>

            <div class="flex items-center mb-4">
                <input type="checkbox" id="remember" class="mr-2">
                <label for="remember" class="text-gray-600">Remember me</label>
            </div>

            <button class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg">
                Iniciar Sesión
            </button>
        </form>

        <p class="text-center text-gray-600 mt-4">¿No tienes una cuenta?
            <a href="{{ route('register') }}" class="text-blue-600 hover:underline">Registrarse</a>
        </p>
    </div>
</body>

</html>