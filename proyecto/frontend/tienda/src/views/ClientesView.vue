<template>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h4>Clientes</h4>
                <RouterLink to="/clientes/create" class="btn btn-primary float-end">
                    Agregar
                </RouterLink>
            </div>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-striped mt-4">
                <thead>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>RFC</th>
                    <th>CURP</th>
                    <th>CP</th>
                </thead>
                <tbody v-if="clientes.length > 0">
                    <tr v-for="(clientes,index) in clientes" :key="index">
                        <td>{{ clientes.id }}</td>
                        <td>{{ clientes.nombre }}</td>
                        <td>{{ clientes.apellido }}</td>
                        <td>{{ clientes.direccion }}</td>
                        <td>{{ clientes.telefono }}</td>
                        <td>{{ clientes.rfc }}</td>
                        <td>{{ clientes.curp }}</td>
                        <td>{{ clientes.cp }}</td>
                        <td>
                            <RouterLink :to="{path: '/clientes/'+ clientes.id +'/edit'}" class="btn btn-outline-success">
                                Editar
                            </RouterLink> 
                            &nbsp;
                            <button class="btn btn-outline-danger" @click="deleteCliente(clientes.id)">Borrar</button>
                        </td>
                    </tr>
                </tbody>
                <t-body v-else>
                    <tr>
                        <td colspan="9" style="text-align: center;">
                            Sin registros
                        </td>
                    </tr>
                </t-body>
            </table>
        </div>
    </div>
</template>

<script>
    import axios from "axios";
    import { RouterLink } from "vue-router";
    export default{
        name: "ClientesView",
        data(){
            return{
                clientes: [],

            }
        },
        mounted(){
            this.getClientes();
        },
        methods:{
            getClientes(){
                axios.get('http://localhost:3000/api/clientes').then(res=>{
                    this.clientes = res.data;
                });
            },
            deleteCliente(idDelClienteABorrar){
                axios.delete('http://localhost:3000/api/clientes/'+idDelClienteABorrar).then(res=>{
                    if (res.data.affectedRows > 0) {
                        this.getClientes(); //se recarguen los datos    
                    };
                });
            }
        }
    }
</script>