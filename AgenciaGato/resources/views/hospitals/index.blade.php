<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Hospitales</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-6">
    <header class="bg-white shadow p-4 flex justify-between items-center">
        <h1 class="text-xl font-bold flex items-center">
            <span class="text-2xl mr-2">❤️</span> MediCare
        </h1>
        <nav>
        <a href="{{ route('dashboard') }}" class="mr-4 text-gray-700">Dashboard</a>
        <a href="{{ route('logout') }}" class="px-4 py-2 border rounded-lg">Salir</a>
        </nav>
    </header>

    <div class="max-w-7xl mx-auto bg-white p-6 shadow-md rounded-md mt-3">
        <h1 class="text-3xl font-bold mb-4">Lista de Hospitales</h1>

        <div class="flex justify-between items-center mb-4">
            <div class="relative w-1/3">
                <span id="searchIcon"
                    class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-500 cursor-pointer">
                    🔍
                </span>
                <input type="text" id="searchInput" placeholder="Buscar por ID o nombre"
                    class="w-full pl-10 p-2 border rounded-md focus:ring focus:ring-blue-300">
            </div>
            <div class="flex space-x-2">
                <button class="bg-yellow-500 text-white px-4 py-2 rounded-md">🔄</button>
                <a href="{{ route('hospitals.create') }}" class="bg-green-500 text-white px-4 py-2 rounded-md">➕</a>
                <button class="bg-gray-500 text-white px-4 py-2 rounded-md">📂 API V2 DOCS</button>
            </div>
        </div>

        <table class="w-full border-collapse border">
            <thead class="bg-gray-200">
                <tr>
                    <th class="border p-2">ID</th>
                    <th class="border p-2">Nombre</th>
                    <th class="border p-2">Antigüedad</th>
                    <th class="border p-2">Distrito</th>
                    <th class="border p-2">Sede</th>
                    <th class="border p-2">Gerente</th>
                    <th class="border p-2">Condición</th>
                    <th class="border p-2">Fecha de Registro</th>
                    <th class="border p-2">Acciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($hospitals as $hospital)
                    <tr class="border">
                        <td class="p-2">{{ $hospital->code }}</td>
                        <td class="p-2">{{ $hospital->name }}</td>
                        <td class="p-2">{{ $hospital->age }}</td>
                        <td class="p-2">{{ $hospital->district }}</td>
                        <td class="p-2">{{ $hospital->venue }}</td>
                        <td class="p-2">{{ $hospital->manager }}</td>
                        <td class="p-2">
                            <span class="px-2 py-1 bg-gray-300 rounded-md">{{ $hospital->condicion }}</span>
                        </td>
                        <td class="p-2">{{ $hospital->registration_date }}</td>
                        <td class="p-2">
                            <a href="{{ route('hospitals.edit', $hospital->id) }}" class="text-blue-500">Editar</a> |
                            <button class="text-red-500"
                                onclick="confirmDelete('{{ route('hospitals.destroy', $hospital->id) }}')">Eliminar</button>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>

    </div>

    <div id="deleteModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center">
        <div class="bg-white p-6 rounded-md shadow-md text-center">
            <h2 class="text-xl font-bold mb-4">¿Estás seguro?</h2>
            <p class="mb-4">Esta acción no se puede deshacer.</p>
            <form id="deleteForm" method="POST">
                @csrf
                @method('DELETE')
                <div class="flex justify-center space-x-4">
                    <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded-md">Eliminar</button>
                    <button type="button" class="bg-gray-500 text-white px-4 py-2 rounded-md"
                        onclick="closeModal()">Cancelar</button>
                </div>
            </form>
        </div>
    </div>

</body>

<script>
    document.getElementById("searchIcon").addEventListener("click", function () {
        let filter = document.getElementById("searchInput").value.toLowerCase(); 
        let rows = document.querySelectorAll("tbody tr");

        rows.forEach(row => {
            let id = row.cells[0].innerText.toLowerCase();
            let name = row.cells[1].innerText.toLowerCase();

            row.style.display = id.includes(filter) || name.includes(filter) ? "" : "none";
        });
    });


    function confirmDelete(url) {
        document.getElementById("deleteForm").action = url;
        document.getElementById("deleteModal").classList.remove("hidden");
    }

    function closeModal() {
        document.getElementById("deleteModal").classList.add("hidden");
    }
</script>

</html>