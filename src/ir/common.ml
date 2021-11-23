type info = Compile_common.info

let mk_info ~tool_name ~source_file ~output_prefix : info =
  Compmisc.init_path ();
  let module_name = "m" in
  let env = Compmisc.initial_env () in
  let ppf_dump = Format.std_formatter in
  let native = true in
  { module_name; output_prefix; env; source_file; ppf_dump; tool_name; native }

module Backend = struct
  (* See backend_intf.mli. *)
  let symbol_for_global' = Compilenv.symbol_for_global'

  let closure_symbol = Compilenv.closure_symbol

  let really_import_approx = Import_approx.really_import_approx

  let import_symbol = Import_approx.import_symbol

  let size_int = Arch.size_int

  let big_endian = Arch.big_endian

  let max_sensible_number_of_arguments =
    (* The "-1" is to allow for a potential closure environment parameter. *)
    Proc.max_arguments_for_tailcalls - 1
end

let backend = (module Backend : Backend_intf.S)
