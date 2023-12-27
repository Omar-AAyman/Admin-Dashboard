@extends('layouts.main')
@section('title', 'Edit Product')
@section('css')

@endsection
@section('content')

@include('partials.message')

    <!-- general form elements -->
    <div class="card col-12 card-warning">
        <div class="card-header">
            <h3 class="card-title">@yield('title')</h3>
        </div>
        <!-- /.card-header -->

        <!-- form start -->
        <form action="{{ route('dashboard.products.update') }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="card-body">
                <div class="form-row my-3">
                    <div class="col-6">
                        <label for="name_en">English Name</label>
                        <input value="{{ $product->name_en }}" type="text" class="form-control" id="name_en" name="name_en"
                            placeholder="Enter product's name in EN">
                        @error('name_en')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-6">
                        <label for="name_ar">Arabic Name</label>
                        <input value="{{ $product->name_ar }}"type="text" class="form-control" id="name_ar" name="name_ar"
                            placeholder="Enter product's name in AR">
                        @error('name_ar')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="form-row my-3">
                    <div class="col-4">
                        <label for="code">Product's Code</label>
                        <input value="{{ $product->code }}"type="number" class="form-control" id="code" name="code"
                            placeholder="Enter product's unique code">
                        @error('code')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-4">
                        <label for="quantity">Quantity</label>
                        <input value="{{ $product->quantity }}" type="number" class="form-control" id="quantity"
                            name="quantity" placeholder="Enter product's available quantity">
                        @error('quantity')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-4">
                        <label for="price">Price</label>
                        <input value="{{ $product->price }}"type="number" class="form-control" id="price" name="price"
                            placeholder="Enter product's price">
                        @error('price')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="form-row my-3">
                    <div class="col-4">
                        <label for="status">Status</label>
                        <select value="{{ $product->status }} " name="status" id="status" class="form-control">
                            @foreach ($statuses as $key => $status)
                                <option @selected($product->status == $key) value="{{ $key }}">{{ $status }}
                                </option>
                            @endforeach
                        </select>
                        @error('status')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-4">
                        <label for="brand_id">Brands</label>
                        <select name="brand_id" id="brand_id" class="form-control">
                            <option value="">No Brand</option>
                            @foreach ($brands as $brand)
                                <option @selected($product->brand_id == $brand->id) value="{{ $brand->id }}">
                                    {{ $brand->name_en . ' - ' . $brand->name_ar }}</option>
                            @endforeach
                        </select>
                        @error('brand_id')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-4">
                        <label for="sub_category_id">Sub Catrogries</label>
                        <select name="sub_category_id" id="sub_category_id" class="form-control">
                            @foreach ($sub_categories as $sub_category)
                                <option @selected($product->sub_category_id == $sub_category->id) value="{{ $sub_category->id }}">
                                    {{ $sub_category->name_en . ' - ' . $sub_category->name_ar }}</option>
                            @endforeach
                        </select>
                        @error('sub_category_id')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                </div>

                <div class="form-row my-3">
                    <div class="col-6">
                        <label for="desc_en">Details In English</label>
                        <textarea name="desc_en" id="desc_en" class="form-control" cols="30" rows="10">{{ $product->desc_en }}</textarea>
                        @error('desc_en')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-6">
                        <label for="desc_ar">Details In Arabic</label>
                        <textarea name="desc_ar" id="desc_ar" class="form-control" cols="30" rows="10">{{ $product->desc_ar }}</textarea>
                        @error('desc_ar')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-4">
                        <h4>Upload Product's Image</h4>
                        <label for="image">
                            <img id="uploadImg" class="w-50" src="{{ asset('assets/images/products/'.$product->image) }}"
                                style="cursor: pointer">
                        </label>
                        <input type="file" name="image" id="image" class="d-none" onchange="loadFile(event)">
                        @error('image')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                </div>

            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <button name="redirect" value="index" class="btn btn-primary  rounded">Create</button>
                <button name="redirect" value="back" class="btn btn-success  rounded">Create & Return Back</button>
            </div>
        </form>
    </div>
    <!-- /.card -->
@endsection


@section('scripts')
    <script>
        var loadFile = function(event) {
            var output = document.getElementById('uploadImg');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function() {
                URL.revokeObjectURL(output.src) //free memory
            }
        };
    </script>
@endsection
