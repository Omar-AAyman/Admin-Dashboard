@extends('layouts.main')
@section('title', 'All Products')
@section('css')
    <!-- DataTables -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}">
    <!-- ./DataTables -->

@endsection

@section('content')
    @include('partials.message')

    <table id="table" class="table table-striped-columns table-hover table-borderless align-middle">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>English Name</th>
                <th>Arabic Name</th>
                <th>Product Code</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Status</th>
                <th>Creation Date</th>
                <th>Modifying Date</th>
                <th>Operations</th>
            </tr>
        </thead>
        <tbody class="table-group-divider">
            @forelse ($products as $product)
                <tr class="table">
                    <td>{{ $product->id }}</td>
                    <td>{{ $product->name_en }}</td>
                    <td>{{ $product->name_ar }}</td>
                    <td>{{ $product->code }}</td>
                    <td>{{ $product->quantity }}</td>
                    <td>{{ $product->price }} EGP</td>
                    <td>{{ $product->status }}</td>
                    <td>{{ $product->created_at }}</td>
                    <td>{{ $product->updated_at }}</td>
                    <td>
                        <a href="{{ route('dashboard.products.edit', ['id' => $product->id]) }}"
                            class="btn btn-outline-warning btn-sm btn-rounded">Edit</a>

                            <form action="{{ route('dashboard.products.destroy', ['id' => $product->id]) }}" class="d-inline"
                            method="post"> 
                            @csrf
                            @method('DELETE')

                            <button class="btn btn-outline-danger btn-sm btn-rounded"> Delete</button>
                            
                        </form>
                    </td>

                </tr>

            @empty
                <tr class="bg-danger"> {{ 'There are no items' }} </tr>
            @endforelse

        </tbody>
    </table>

@endsection

@section('scripts')

    <!-- DataTables  & Plugins -->
    <script src="{{ asset('assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/jszip/jszip.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/pdfmake/pdfmake.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/pdfmake/vfs_fonts.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>




    <!-- Page specific script -->
    <script>
        $(function() {
            $("#table").DataTable({
                "responsive": true,
                "lengthChange": false,
                "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
            }).buttons().container().appendTo('#examp  le1_wrapper .col-md-6:eq(0)');

        });
    </script>
    </body>
@endsection
