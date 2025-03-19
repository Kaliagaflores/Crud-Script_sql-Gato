<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Hospital</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="w-full max-w-lg bg-white p-8 shadow-md rounded-md">
        <h1 class="text-2xl font-bold text-center mb-5">Registrar un Nuevo Hospital</h1>

        @if ($errors->any())
            <div class="bg-red-200 text-red-700 p-3 rounded-md mb-4">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        @include('hospitals._form', ['hospital' => new App\Models\Hospital])

        <div class="mt-4 text-center">
            <a href="{{ route('hospitals.index') }}" class="text-blue-500 hover:underline">Volver a la Lista</a>
        </div>
    </div>
</body>
<script>
    document.getElementById("clearForm").addEventListener("click", function () {
        let form = document.getElementById("hospitalForm");
        form.reset();

       
        let inputs = form.querySelectorAll("input, textarea");
        inputs.forEach(input => {
            input.value = "";
        });
    });
</script>

</html>
