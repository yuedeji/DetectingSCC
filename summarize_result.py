import os
import sys
import csv

graph_list = ["livejournal", "baidu", "flickr-growth", "zhishi-hudong-relatedpages", "pokec", "wikipedia_link_en", "wikipedia_en", "dbpedia", "facebook", "wiki_communication", "random", "RMAT", "wiki_talk_en", "twitter_mpi", "twitter_www", "friendster"]

method_list = ["vHong_p1_q1_w4.result", "wHong_p1_q1_w4.result", "vSlota_p1_q0_w4.result", "wSlota_p1_q0_w4.result"]

def dump_list_to_csv(output_list, output_file):
    with open(output_file, "a") as fp:
        csv_write = csv.writer(fp)
        csv_write.writerow(output_list)
    print "output is saved in file %s" %(output_file)

def summarize_result(graph, graph_path, output_file):

    result_list = [graph]
    for method in method_list:
        input_file = graph_path + "_" + method
        if not os.path.isfile(input_file):
            continue

        with open(input_file, "r") as fp:
            index = 0
            for line in fp:
                if line.startswith("Time"):
                    index += 1
                    tm = float(line.split(":")[-1].strip())
                    result_list.append(tm)
                if index == 10:
                    result_list.append(" ")
                    break

    dump_list_to_csv(result_list, output_file)

def main(input_folder, output_file):

    if os.path.exists(output_file):
        os.remove(output_file)

    for graph in graph_list:
        summarize_result(graph, os.path.join(input_folder, graph), output_file)

#    for file_name in file_list:
#        file_one = os.path.join(input_folder, file_name)
#        file_size = os.path.getsize(file_one)
#        if file_size == 0:
#            continue
#        summarize_result(file_one, output_file)

if __name__ == "__main__":

    if len(sys.argv) != 3:
        print "Usage: python <summarize_result.py> <input_folder> <output_file>\n"
        exit(-1)

    main(sys.argv[1], sys.argv[2])
