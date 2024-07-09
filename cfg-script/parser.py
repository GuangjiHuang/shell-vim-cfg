import os
import time
import sys
import shutil

def parser_var_section():
    pass

def parser_tool_section():
    pass

def extend_value(var_dict, be_extended_str):

    for var in var_dict.keys():
        find_str = "${" + var + "}"
        if find_str in be_extended_str:
            be_extended_str = be_extended_str.replace(find_str, var_dict[var])

    return be_extended_str

def operate_path(path_dict, op):
    # get the path and the dir
    src = os.path.expanduser(path_dict["src"])
    dst = os.path.expanduser(path_dict["dst"])
    bd = os.path.expanduser(path_dict["bd"])
    src_dir = os.path.dirname(src)
    dst_dir = os.path.dirname(dst)
    bd_dir = os.path.dirname(bd)
    # check
    is_src_exists = os.path.exists(src)
    is_dst_exists = os.path.exists(dst)
    is_bd_exists = os.path.exists(bd)
    is_src_dir_exists = os.path.exists(src_dir)
    is_dst_dir_exists = os.path.exists(dst_dir)
    is_bd_dir_exists = os.path.exists(bd_dir)
    # s: src, b: backen, d: destination
    if op == "s2b":
        if not is_src_exists:
            print(f"{src} no exists!")
            return
        if not is_bd_dir_exists:
            os.makedirs(bd_dir)
        os.system(f"rm -rf {bd}")
        os.system(f"cp -fr {src} {bd}")
        print(f"{src} -> {bd}")

    elif op == "s2d":
        if not is_src_exists:
            print(f"{src} no exists!")
            return
        if not is_dst_dir_exists:
            os.makedirs(dst_dir)
        os.system(f"rm -rf {dst}")
        os.system(f"cp -fr {src} {dst}")
        print(f"{src} -> {dst}")

    elif op == "b2s":
        if not is_bd_exists:
            print(f"{bd} no exists!")
            return
        if not is_src_dir_exists:
            os.makedirs(src_dir)
        os.system(f"rm -rf {src}")
        os.system(f"cp -fr {bd} {src}")
        print(f"{bd} -> {src}")

    elif op == "b2d":
        if not is_bd_exists:
            print(f"{bd} no exists!")
            return
        if not is_dst_dir_exists:
            os.makedirs(dst_dir)
        os.system(f"rm -rf {dst}")
        os.system(f"cp -fr {bd} {dst}")
        print(f"{bd} -> {dst}")

    elif op == "d2s":
        if not is_dst_exists:
            print(f"{dst} no exists!")
            return
        if not is_src_dir_exists:
            os.makedirs(src_dir)
        os.system(f"rm -rf {src}")
        os.system(f"cp -fr {dst} {src}")
        print(f"{dst} -> {src}")

    elif op == "d2b":
        if not is_dst_exists:
            print(f"{dst} no exists!")
            return
        if not is_bd_dir_exists:
            os.makedirs(bd_dir)
        os.system(f"rm -rf {bd}")
        os.system(f"cp -fr {dst} {bd}")
        print(f"{dst} -> {bd}")

    else:
        return

def operate_file(file_dict, op):
    for path_key, path_value in file_dict.items():
        operate_path(path_value, op)


def operate_block(block_dict, op):
    for file_key, file_value in block_dict.items():
        print(f"-------------------- [{file_key}] --------------------")
        operate_file(file_value, op)


def parser_file(file_name):
    lines = []
    cfg_dict = {}

    with open(file_name, "r") as f:
        lines = f.readlines()

    session = {}

    for line in lines:
        # strip
        line = line.strip()
        if len(line) == 0 or line.startswith("#"):
            continue

        if line.startswith("[") and line.endswith("]"):
            session_key = line[1:-1]
            session[session_key] = {}

        elif line[0].isdigit and line[1] == ")":
            sub_key = line[2:].strip()
            if len(sub_key) == 0:
                continue
            session[session_key][sub_key] = {}

        else:
            line_ls = line.split(":")
            if len(line_ls) != 2:
                continue
            key, value = line_ls[0].strip(), line_ls[1].strip()

            if session_key == "var":
                session[session_key].update({key: value})
            else:
                session["var"]["file"] = sub_key
                value = extend_value(session["var"], value)
                session[session_key][sub_key].update({key: value})

    session_name = os.path.basename(file_name)
    session_name = session_name.split(".")[0]

    if session_name in session.keys():
        return {session_name: session[session_name]}
    else:
        return {session_name: {}}


if __name__ == "__main__":

    op_ls = ["s2b", "s2d", "b2s", "b2d", "d2s", "d2b"]

    file_path_ls = ["bash.hgj", 
                    "vim.hgj",
                    "tmux.hgj",
                    "git.hgj",
                    "input.hgj"
                    ]

    block_ls = []
    for file_path in file_path_ls:
        block_ls.append(file_path.split(".")[0].strip())

    ret_dict = {}
                    
    args = sys.argv
    if len(args) == 1:
        print("usage: python3 parser.py bash .bashrc s2d")
        print(f"Error: args must at least specify the operator , include the: {op_ls}")
        exit(1)
    elif len(args) >= 2:
        op_type = args[-1].strip()
        if op_type not in op_ls:
            print("usage: python3 parser.py bash .bashrc s2d")
            print(f"Error: args must at least: {op_ls}, instead of the {op_type}")
            exit(1)
        # here prompt to
        if "2d" in op_type:
            confirm = input("---- Copy to the  destination, you local will be conver. Yes / No ?")
            if not confirm.lower() == "yes":
                print("---- Cancel you operation! -----")
                exit(1)

        if len(args) == 2:
            # run all the block
            for file_path in file_path_ls:
                tmp = parser_file(file_path)
                ret_dict.update(tmp)
            # operate
            operate_block(ret_dict, op_type)

        elif len(args) == 3 or len(args) == 4:
            # just run the one block
            block_name = args[1].strip()
            if not block_name in block_ls:
                print("can not found the block, block must be as one of the: {block_ls}")
                exit(1)
            ret_dict = parser_file(f"{block_name}.hgj")[block_name]
            if len(args) == 4:
                file_name = args[2].strip()
                if not file_name in ret_dict.keys():
                    print(f"{file_name} not in the block: {block_name}")
                    exit(1)
                ret_dict = ret_dict[file_name]
                # operate
                operate_path(ret_dict, op_type)
            else:
                operate_file(ret_dict, op_type)

        elif len(args) > 4:
            print("usage: python3 parser.py bash .bashrc s2d")
            exit(1)

    #print(ret_dict)

