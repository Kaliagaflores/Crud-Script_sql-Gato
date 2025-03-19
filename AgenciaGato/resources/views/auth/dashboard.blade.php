<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital System - MediCare</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <header class="bg-white shadow p-4 flex justify-between items-center">
        <h1 class="text-xl font-bold flex items-center">
            <span class="text-2xl mr-2">❤️</span> MediCare
        </h1>
        <nav>
            <a href="{{ route('dashboard') }}" class="mr-4 text-gray-700">Dashboard</a>
            <a href="{{ route('logout') }}" class="px-4 py-2 border rounded-lg">Salir</a>
        </nav>
    </header>

    <main class="max-w-4xl mx-auto mt-10 p-6 bg-white shadow rounded-lg">
        <h2 class="text-2xl font-bold">Hospital System</h2>
        <h3 class="mt-4 text-lg font-semibold">Gestión</h3>
        <div class="mt-4 space-y-4">
            <a href="{{ route('hospitals.index') }}" class="flex items-center bg-gray-200 p-4 rounded-lg shadow hover:bg-gray-300">
                <span class="text-xl mr-4">📋</span>
                <div>
                    <p class="font-semibold">Hospitals</p>
                    <p class="text-sm text-gray-600">Read Operation</p>
                </div>
            </a>

            <a href="{{ route('hospitals.create') }}" class="flex items-center bg-gray-200 p-4 rounded-lg shadow hover:bg-gray-300">
                <span class="text-xl mr-4">➕</span>
                <div>
                    <p class="font-semibold">New Hospital</p>
                    <p class="text-sm text-gray-600">Create Operation</p>
                </div>
            </a>

            <a href="{{ route('hospitals.index') }}" class="flex items-center bg-gray-200 p-4 rounded-lg shadow hover:bg-gray-300">
                <span class="text-xl mr-4">✏️</span>
                <div>
                    <p class="font-semibold">Update Hospital</p>
                    <p class="text-sm text-gray-600">Update Operation</p>
                </div>
            </a>

            <a href="{{ route('hospitals.index') }}" class="flex items-center bg-gray-200 p-4 rounded-lg shadow hover:bg-gray-300">
                <span class="text-xl mr-4">🗑️</span>
                <div>
                    <p class="font-semibold">Delete Hospital</p>
                    <p class="text-sm text-gray-600">Delete Operation</p>
                </div>
            </a>

            <a href="{{ route('logout') }}" class="flex items-center bg-gray-200 p-4 rounded-lg shadow hover:bg-gray-300">
                <span class="text-xl mr-4">⏻</span>
                <div>
                    <p class="font-semibold">End session</p>
                    <p class="text-sm text-gray-600">Log Out</p>
                </div>
            </a>
        </div>
    </main>
</body>
</html>
