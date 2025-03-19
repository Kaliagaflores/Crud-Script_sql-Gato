<form id="hospitalForm" 
    action="{{ isset($hospital) && $hospital->id ? route('hospitals.update', $hospital->id) : route('hospitals.store') }}" 
    method="POST"
    >
    
    @csrf
    @if (isset($hospital) && $hospital->id)
        @method('PUT') 
    @endif
    <div class="mb-4">
        <label class="block text-gray-700">Código del Hospital:</label>
        <input type="text" name="code" value="{{ old('code', $hospital->code ?? '') }}"
            class="w-full p-2 border rounded-md" required>
    </div>

    <div class="mb-4">
        <label class="block text-gray-700">Nombre:</label>
        <input type="text" name="name" value="{{ old('name', $hospital->name ?? '') }}"
            class="w-full p-2 border rounded-md" required>
    </div>

    <div class="mb-4">
        <label class="block text-gray-700">Antigüedad (años):</label>
        <input type="number" name="age" value="{{ old('age', $hospital->age ?? '') }}"
            class="w-full p-2 border rounded-md" required min="1">
    </div>

    <div class="mb-4">
        <label class="block text-gray-700">Distrito:</label>
        <input type="text" name="district" value="{{ old('district', $hospital->district ?? '') }}"
            class="w-full p-2 border rounded-md" required>
    </div>

    <div class="mb-4">
        <label class="block text-gray-700">Sede:</label>
        <textarea name="venue" class="w-full p-2 border rounded-md" required>{{ old('venue', $hospital->venue ?? '') }}</textarea>
    </div>

    <div class="mb-4">
        <label class="block text-gray-700">Gerente:</label>
        <input type="text" name="manager" value="{{ old('manager', $hospital->manager ?? '') }}"
            class="w-full p-2 border rounded-md" required>
    </div>

    <div class="mb-4">
        <label class="block text-gray-700">Condición:</label>
        <input type="text" name="condicion" value="{{ old('condicion', $hospital->condicion ?? '') }}"
            class="w-full p-2 border rounded-md" required>
    </div>

    <div class="mb-4">
        <label class="block text-gray-700">Fecha de Registro:</label>
        <input type="date" name="registration_date" value="{{ old('registration_date', $hospital->registration_date ?? '') }}"
            class="w-full p-2 border rounded-md" required>
    </div>

    <button type="submit" class="w-full bg-blue-500 text-white p-2 rounded-md hover:bg-blue-600">
        {{ isset($hospital) && $hospital->id ? 'Actualizar Hospital' : 'Registrar Hospital' }}
    </button>

    <button type="button" id="clearForm" class="w-full bg-red-500 text-white p-2 rounded-md hover:bg-red-600 mt-2">
        Limpiar
    </button>
</form>


